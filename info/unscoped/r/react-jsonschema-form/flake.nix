{

  inputs.packument.url   = "https://registry.npmjs.org/react-jsonschema-form?rev=122-6941f4c80941fde15d8602448e2eeb62";
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
    ident = "react-jsonschema-form";
    ldir  = "info/unscoped/r/react-jsonschema-form";
    inherit packument fetchInfo;
  } // latest';

}
