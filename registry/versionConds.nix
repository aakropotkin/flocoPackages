# ============================================================================ #
#
#
#
# ---------------------------------------------------------------------------- #

{ lib }: let

# ---------------------------------------------------------------------------- #

  # The default
  isRelease = version: lib.test "[^a-zA-Z+-]*" version;

  ignoreVersions = ignores: version:
    ! ( builtins.elem version ignores );

# ---------------------------------------------------------------------------- #

in {

# ---------------------------------------------------------------------------- #

  # Dead Links
  # TODO: read a JSON file with these fields and map over it.

  graphql-tools.merge = version: let
    ignores = ["6.2.8"];  # Dead download link
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
    ignores = ["0.0.0" "0.6.21" "1.0.1" "1.0.4"];  # Dead download link
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
    ignores = ["0.2.0" "0.2.1"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.node-pre-gyp = version: let
    ignores = ["0.5.20"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.node-watch = version: let
    ignores = ["0.1.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.oboe = version: let
    ignores = ["1.12.1"];  # Dead download link
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

  unscoped.rollup-plugin-babel = version: let
    ignores = ["2.3.7"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.vue = version: let
    ignores = ["0.8.6"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.run-sequence = version: let
    ignores = ["0.3.5"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.seek-bzip = version: let
    ignores = ["1.0.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.selenium-webdriver = version: let
    ignores = ["2.43.1" "2.43.2" "2.43.3"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.stackframe = version: let
    ignores = ["0.1.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.tslint = version: let
    ignores = ["0.4.1"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.unified = version: let
    ignores = ["2.1.3"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );

  unscoped.xlsx = version: let
    ignores = ["0.7.0"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions ignores version );


# ---------------------------------------------------------------------------- #

  # Damaged archive
  unscoped.axe-core = version: let
    ignores = ["3.1.3"];
  in ( isRelease version ) && ( ignoreVersions ignores version );

  # Too many top-level files.
  # NOTE: only effects `type = "tarball"' but fuck it - its a beta release.
  unscoped.xmldom = version: let
    ignores = ["0.1.0"];
  in ( isRelease version ) && ( ignoreVersions ignores version );


# ---------------------------------------------------------------------------- #

  # Excessive number of versions

  types.node = version:
    builtins.elem version ( lib.importJSON ./types-node-versions.json );


  unscoped.aws-sdk= version: let
    keeps   = ( lib.importJSON ./aws-sdk-versions.json );
    ignores = ["1.16.0"];  # Dead download link
  in ( builtins.elem version keeps ) && ( ignoreVersions ignores version );


# ---------------------------------------------------------------------------- #

}  # End


# ---------------------------------------------------------------------------- #
#
#
#
# ============================================================================ #
