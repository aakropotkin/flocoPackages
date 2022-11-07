{

  inputs.packument.url   = "https://registry.npmjs.org/xml2json?rev=108-58eeca6d3df52d523d961dbacdc5a879";
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
    ident = "xml2json";
    ldir  = "info/unscoped/x/xml2json";
    inherit packument fetchInfo;
  } // latest';

}
