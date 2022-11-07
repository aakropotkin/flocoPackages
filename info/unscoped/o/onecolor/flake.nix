{

  inputs.packument.url   = "https://registry.npmjs.org/onecolor?rev=79-0e9524963cdc2b5e00de98a9d0cd4822";
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
    ident = "onecolor";
    ldir  = "info/unscoped/o/onecolor";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
