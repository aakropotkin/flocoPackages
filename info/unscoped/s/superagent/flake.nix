{

  inputs.packument.url   = "https://registry.npmjs.org/superagent?rev=665-50fc23086db99b1502e1746e27183c04";
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
    ident = "superagent";
    ldir  = "info/unscoped/s/superagent";
    inherit packument fetchInfo;
  } // latest';

}
