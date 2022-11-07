{

  inputs.packument.url   = "https://registry.npmjs.org/prompt?rev=268-cb89d11890b5b02f16572c5f53f69267";
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
    ident = "prompt";
    ldir  = "info/unscoped/p/prompt";
    inherit packument fetchInfo;
  } // latest';

}
