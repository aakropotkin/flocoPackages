{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/object-is?_rev=20-8d022ceabc034701165e438876d3b20a";
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
    ident = "object-is";
    ldir  = "info/unscoped/o/object-is";
    inherit packument fetchInfo;
  } // latest';

}
