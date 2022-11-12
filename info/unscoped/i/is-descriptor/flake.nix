{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-descriptor?_rev=14-4995a9269469e015cc293ec92ffa3a16";
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
    ident = "is-descriptor";
    ldir  = "info/unscoped/i/is-descriptor";
    inherit packument fetchInfo;
  } // latest';

}
