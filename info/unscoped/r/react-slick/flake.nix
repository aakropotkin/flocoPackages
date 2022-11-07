{

  inputs.packument.url   = "https://registry.npmjs.org/react-slick?rev=153-9d87e3efdb2b0ca39f919d8847f1fc31";
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
    ident = "react-slick";
    ldir  = "info/unscoped/r/react-slick";
    inherit packument fetchInfo;
  } // latest';

}
