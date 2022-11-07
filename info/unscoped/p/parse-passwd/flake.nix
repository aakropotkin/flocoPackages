{

  inputs.packument.url   = "https://registry.npmjs.org/parse-passwd?rev=4-0a7f27f6fcf45babaa47f28ef1fe740b";
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
    ident = "parse-passwd";
    ldir  = "info/unscoped/p/parse-passwd";
    inherit packument fetchInfo;
  } // latest';

}
