{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-relative?_rev=17-2582c2e309e6e40560df307b58d4c437";
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
    ident = "is-relative";
    ldir  = "info/unscoped/i/is-relative";
    inherit packument fetchInfo;
  } // latest';

}
