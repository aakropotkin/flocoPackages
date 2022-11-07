{

  inputs.packument.url   = "https://registry.npmjs.org/callsite?rev=23-0a22c89655be52054f8cbee4aa5f1e96";
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
    ident = "callsite";
    ldir  = "info/unscoped/c/callsite";
    inherit packument fetchInfo;
  } // latest';

}
