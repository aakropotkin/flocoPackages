{

  inputs.packument.url   = "https://registry.npmjs.org/levelup?rev=321-21588dc944f56f34845eba6ffeb2b358";
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
    ident = "levelup";
    ldir  = "info/unscoped/l/levelup";
    inherit packument fetchInfo;
  } // latest';

}
