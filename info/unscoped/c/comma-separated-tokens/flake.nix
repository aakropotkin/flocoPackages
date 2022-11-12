{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/comma-separated-tokens?_rev=15-b28b79544ffcbad2b3c09367d6c75257";
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
    ident = "comma-separated-tokens";
    ldir  = "info/unscoped/c/comma-separated-tokens";
    inherit packument fetchInfo;
  } // latest';

}
