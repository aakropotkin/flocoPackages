{ lib }: let

  # The default
  isRelease = version: lib.test "[^a-zA-Z+-]*" version;

  ignoreVersions = ignores: version:
    ! ( builtins.elem version ignores );

in {

  graphql-tools.merge = version: let
    ignores = ["6.2.8"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.aws-sdk= version: let
    ignores = ["1.16.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.browser-pack = version: let
    ignores = ["1.0.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.color-convert = version: let
    ignores = ["0.3.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.error-stack-parser = version: let
    ignores = ["0.1.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.event-stream = version: let
    ignores = ["0.9.1"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.faker = version: let
    ignores = ["2.0.0" "2.0.2"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.figlet = version: let
    ignores = ["1.0.2"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.firebase = version: let
    ignores = [
      "0.0.0" "0.6.21"
      "1.0.1" "1.0.4"
    ];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.gulp-concat = version: let
    ignores = ["2.1.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.ioredis = version: let
    ignores = ["1.0.5"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.is-generator-function = version: let
    ignores = ["0.0.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.jest = version: let
    ignores = ["0.0.7"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.liftoff = version: let
    ignores = ["0.8.5"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.metalsmith = version: let
    ignores = ["0.2.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.node-pre-gyp = version: let
    ignores = ["0.5.20"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.node-watch = version: let
    ignores = ["0.1.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.oboe = version: let
    ignores = ["1.21.1"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.pbkdf2 = version: let
    ignores = ["0.0.3"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.postcss-custom-properties = version: let
    ignores = ["9.0.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.pouchdb = version: let
    ignores = ["2.2.1"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

}
