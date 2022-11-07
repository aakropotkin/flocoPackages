{

  inputs.packument.url   = "https://registry.npmjs.org/make-fetch-happen?rev=139-907d1a4cd90da8145d6bb3e5bd518fea";
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
    ident = "make-fetch-happen";
    ldir  = "info/unscoped/m/make-fetch-happen";
    inherit packument fetchInfo;
  } // latest';

}
