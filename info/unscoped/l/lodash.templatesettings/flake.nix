{

  inputs.packument.url   = "https://registry.npmjs.org/lodash.templatesettings?rev=44-5f3c3b37dd29ad029b771c1f74dc088e";
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
    ident = "lodash.templatesettings";
    ldir  = "info/unscoped/l/lodash.templatesettings";
    inherit packument fetchInfo;
  } // latest';

}
