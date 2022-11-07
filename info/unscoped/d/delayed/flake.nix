{

  inputs.packument.url   = "https://registry.npmjs.org/delayed?rev=17-5c30627569cf4111a6472b6d4bbf0a00";
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
    ident = "delayed";
    ldir  = "info/unscoped/d/delayed";
    inherit packument fetchInfo;
  } // latest';

}
