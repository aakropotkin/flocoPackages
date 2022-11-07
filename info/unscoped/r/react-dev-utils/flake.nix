{

  inputs.packument.url   = "https://registry.npmjs.org/react-dev-utils?rev=210-4d5ef5859375a4cb858fbf0da5896cfa";
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
    ident = "react-dev-utils";
    ldir  = "info/unscoped/r/react-dev-utils";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
