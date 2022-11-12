{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mdast-util-definitions?_rev=24-d0f9e365fff409adb2f9d47dda977d68";
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
    ident = "mdast-util-definitions";
    ldir  = "info/unscoped/m/mdast-util-definitions";
    inherit packument fetchInfo;
  } // latest';

}
