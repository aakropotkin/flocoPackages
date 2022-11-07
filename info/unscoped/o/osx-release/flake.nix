{

  inputs.packument.url   = "https://registry.npmjs.org/osx-release?rev=10-b08d4634d8ff95fa59bce4a18240a7f8";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "osx-release";
    ldir  = "info/unscoped/o/osx-release";
    inherit packument fetchInfo;
  } // latest';

}
