{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.isplainobject?rev=47-ebc8a10de2671914f27e90727928f25f";
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
    ident = "lodash.isplainobject";
    ldir  = "info/unscoped/l/lodash.isplainobject";
    inherit packument fetchInfo;
  } // latest';

}
