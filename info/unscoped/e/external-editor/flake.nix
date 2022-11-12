{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/external-editor?_rev=22-ff10aa2007a7487c0f234b6a305d68d0";
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
    ident = "external-editor";
    ldir  = "info/unscoped/e/external-editor";
    inherit packument fetchInfo;
  } // latest';

}
