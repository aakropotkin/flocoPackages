{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dependency-graph?_rev=38-7ce1bfd680510b10822cdb0357b7eb5e";
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
    ident = "dependency-graph";
    ldir  = "info/unscoped/d/dependency-graph";
    inherit packument fetchInfo;
  } // latest';

}
