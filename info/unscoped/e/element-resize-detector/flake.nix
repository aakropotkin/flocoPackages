{

  inputs.packument.url   = "https://registry.npmjs.org/element-resize-detector?rev=58-4e5e125193b5b67023d4304033ef0f93";
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
    ident = "element-resize-detector";
    ldir  = "info/unscoped/e/element-resize-detector";
    inherit packument fetchInfo;
  } // latest';

}
