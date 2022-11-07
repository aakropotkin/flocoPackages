{

  inputs.packument.url   = "https://registry.npmjs.org/xml-parse-from-string?rev=8-46aabb9aeb0e34c359b632594d70308b";
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
