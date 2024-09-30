# Arcade Start

A starting point for your [Arcade](https://pub.dev/packages/arcade) server.

## Get Started

Create a `.env` file at the root and add the `port` variable:

```shell
echo "port=7331" > .env
```

Run `build_runner build`:

```shell
dart run build_runner build --delete-conflicting-outputs
```

Or to watch:

```shell
dart run build_runner watch --delete-conflicting-outputs
```

Serve your application:

```shell
arcade serve
```