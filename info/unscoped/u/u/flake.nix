{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/u?_rev=6-5105f8c2bb8afaede9415306c1838f63";
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
    ident = "u";
    ldir  = "info/unscoped/u/u";
    inherit packument fetchInfo;
  } // latest';

}
