{

  inputs.packument.url   = "https://registry.npmjs.org/busboy?rev=168-bd67b9de2ec65a6f63c2705d88db3a59";
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
    ident = "busboy";
    ldir  = "info/unscoped/b/busboy";
    inherit packument fetchInfo;
  } // latest';

}
