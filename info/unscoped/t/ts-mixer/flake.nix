{

  inputs.packument.url   = "https://registry.npmjs.org/ts-mixer?rev=40-c4b5b27f5ee791cdd30c78c6f23f67b9";
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
    ident = "ts-mixer";
    ldir  = "info/unscoped/t/ts-mixer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
