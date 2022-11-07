{

  inputs.packument.url   = "https://registry.npmjs.org/regjsparser?rev=53-d96ce109ecc9d0580f97fc0fc5de3592";
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
    ident = "regjsparser";
    ldir  = "info/unscoped/r/regjsparser";
    inherit packument fetchInfo;
  } // latest';

}
