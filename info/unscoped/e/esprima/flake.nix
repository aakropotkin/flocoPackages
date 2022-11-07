{

  inputs.packument.url   = "https://registry.npmjs.org/esprima?rev=177-6d1e62126e1ba9da9abcf11c8c048efb";
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
    ident = "esprima";
    ldir  = "info/unscoped/e/esprima";
    inherit packument fetchInfo;
  } // latest';

}
