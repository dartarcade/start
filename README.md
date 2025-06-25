# Arcade Start

A comprehensive starter template for building server applications with [Arcade](https://pub.dev/packages/arcade) - featuring database integration, caching, object storage, and a complete development environment.

## Features

- **Arcade Framework**: Modern Dart server framework with routing, hooks, and OpenAPI support
- **Database**: PostgreSQL with Drift ORM and migration support
- **Caching**: Redis integration for high-performance caching
- **Object Storage**: MinIO for S3-compatible file storage
- **Code Generation**: Automated code generation with build_runner
- **Dependency Injection**: Clean architecture with GetIt and Injectable
- **API Documentation**: Built-in Swagger UI with authentication
- **Development Tools**: pgAdmin, RedisInsight, and MinIO Console
- **Example Module**: Complete Todo CRUD implementation

## Prerequisites

- **Docker**: Required for running PostgreSQL, Redis, and MinIO services
  - Install from [docker.com](https://www.docker.com/get-started/)
- **Dart SDK**: Version 3.0 or higher
  - Install from [dart.dev](https://dart.dev/get-dart)
- **dpk (Dartpack)**: Script runner for Dart projects

  ```bash
  dart pub global activate dpk
  ```

## Quick Start

1. **Clone and setup the project**

   ```bash
   # Clone this template
   git clone <your-repo-url>
   cd arcade_start

   # Install dependencies
   dpk get
   ```

2. **Configure environment**

   ```bash
   # Copy the example environment file
   cp .env.example .env
   ```

   The `.env.example` file is pre-configured with defaults that work with the Docker setup.

3. **Start Docker services**

   ```bash
   dpk run docker
   # Or manually: docker compose up
   ```

4. **Generate code**

   ```bash
   # One-time build
   dpk run build

   # Or watch mode for development
   dpk run watch
   ```

5. **Start the development server**

   ```bash
   dpk run dev
   ```

   Your server will be running at `http://localhost:7331`

6. **Access Swagger UI**

   Navigate to `http://localhost:7331/ui`

   - Username: `admin`
   - Password: `admin`

## Project Structure

```text
arcade_start/
├── bin/                    # Application entry points
│   ├── start.dart         # Main server executable
│   └── routes.dart        # Route metadata generator
├── lib/
│   ├── core/              # Core application setup
│   │   ├── database/      # Database connection and configuration
│   │   ├── env.dart       # Environment variables
│   │   └── init.dart      # App initialization and DI setup
│   ├── modules/           # Feature modules
│   │   └── todos/         # Example Todo module
│   │       ├── controllers/
│   │       ├── data/
│   │       ├── models/
│   │       ├── repositories/
│   │       └── services/
│   └── shared/            # Shared utilities and models
├── scripts/               # Utility scripts for development
├── docker-compose.yml     # Docker services configuration
├── dpk.yaml              # Dartpack scripts configuration
└── .env.example          # Environment variables template
```

## Available Scripts

All scripts are defined in `dpk.yaml` and can be run with `dpk run <script-name>`:

| Script        | Command                          | Description                  |
| ------------- | -------------------------------- | ---------------------------- |
| `docker`      | `docker compose up`              | Start all Docker services    |
| `dev`         | `arcade serve`                   | Start the development server |
| `clean`       | `dart run build_runner clean`    | Clean generated files        |
| `build`       | `dart run build_runner build -d` | Generate code once           |
| `watch`       | `dart run build_runner watch -d` | Watch and regenerate code    |
| `clean:build` | Clean then build                 | Clean and regenerate code    |
| `clean:watch` | Clean then watch                 | Clean and watch for changes  |

## Services

### PostgreSQL Database

- **Port**: 5432
- **Credentials**: postgres/postgres
- **Database**: db
- **Admin UI**: pgAdmin at <http://localhost:8080>
  - Email: `admin@example.com`
  - Password: admin

### Redis Cache

- **Port**: 6379
- **Browser**: RedisInsight at <http://localhost:8001>

### MinIO Object Storage

- **API Port**: 9000
- **Console**: <http://localhost:9001>
- **Credentials**: minioadmin/minioadmin
- **Default Bucket**: default-bucket

## Development Workflow

### Code Generation

This project uses several code generators:

- **Drift**: Database ORM and migrations
- **Freezed**: Immutable data classes
- **Injectable**: Dependency injection
- **JSON Serializable**: JSON serialization
- **Envied**: Type-safe environment variables

Run code generation:

```bash
# One-time generation
dpk run build

# Watch mode (recommended during development)
dpk run watch
```

### Reset Scripts

Utility scripts are available in the `scripts/` directory:

```bash
# Reset individual services
./scripts/reset-postgres.sh
./scripts/reset-redis.sh
./scripts/reset-minio.sh

# Reset all data
./scripts/reset-all-data.sh

# Skip confirmation prompt
./scripts/reset-all-data.sh -y
```

## API Development

### Creating New Endpoints

1. Create a new module in `lib/modules/`
2. Define controllers with route groups and handlers
3. Add models with Freezed for type safety
4. Implement services and repositories
5. Register dependencies with `@singleton` or `@injectable` annotations

### Example: Todo Module

The template includes a complete Todo CRUD implementation:

```dart
// Controller example
@singleton
class TodoController {
  final TodoService todoService;

  TodoController(this.todoService) {
    route.group<RequestContext>(
      '/todos',
      defineRoutes: (route) {
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Get all todos',
            )
            .get('/')
            .handle(getTodos);
        
        route()
            .swagger(
              tags: ['Todos'],
              summary: 'Create a todo',
              request: $CreateTodoRequestSchema,
            )
            .post('/')
            .handle(createTodo);
      },
    );
  }

  Future<List<TodoDataResponse>> getTodos(RequestContext context) {
    return todoService.getTodos()
        .then((todos) => todos.map((todo) => todo.toTodoDataResponse).toList());
  }

  Future<TodoDataResponse> createTodo(RequestContext context) async {
    context.statusCode = 201;
    final request = await $CreateTodoRequestValidate.withContext(context);
    return todoService.createTodo(request)
        .then((todo) => todo.toTodoDataResponse);
  }
}
```

### Validation

Use Luthor for request validation with generated validators:

```dart
// Automatic validation with generated validator
final request = await $CreateTodoRequestValidate.withContext(context);
```

## Environment Variables

Configure your application through the `.env` file:

```env
# Server
PORT=7331

# Database
DATABASE_URL=postgres://postgres:postgres@localhost:5432/db

# Cache
REDIS_URL=redis://localhost:6379

# Object Storage
MINIO_ENDPOINT=localhost
MINIO_PORT=9000
MINIO_ROOT_USER=minioadmin
MINIO_ROOT_PASSWORD=minioadmin
MINIO_BUCKET=default-bucket
```

## Troubleshooting

### Port Conflicts

If you encounter port conflicts, modify the ports in `docker-compose.yml` and update your `.env` file accordingly.

### Code Generation Issues

```bash
# Clean and rebuild
dpk run clean:build
```

### Database Connection Issues

Ensure Docker services are running:

```bash
docker compose ps
```

## Next Steps

1. Explore the Todo module implementation
2. Create your own modules following the same pattern
3. Customize the authentication in `lib/core/init.dart`
4. Add your business logic and API endpoints
5. Configure production deployment settings

## License

This is a template repository. Feel free to use it as a starting point for your Arcade projects.
