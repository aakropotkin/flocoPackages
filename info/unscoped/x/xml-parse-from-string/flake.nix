{

  inputs.packument.url   = "https://registry.npmjs.org/xml-parse-from-string";
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
    ident = "xml-parse-from-string";
    ldir  = "info/unscoped/x/xml-parse-from-string";
    inherit packument fetchInfo;
  } // latest';

}
