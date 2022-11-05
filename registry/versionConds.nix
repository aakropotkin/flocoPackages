{ lib }: let

  # The default
  isRelease = version: lib.test "[^a-zA-Z+-]*" version;

  ignoreVersions = ignores: version:
    ! ( builtins.elem version ignores );

in {

  graphql-tools.merge = version: let
    ignores = ["6.2.8"];  # Dead download link
  in ( isRelease version ) && ( ignoreVersions version );

}
