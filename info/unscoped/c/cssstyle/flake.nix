{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/cssstyle?_rev=105-be86eff1e12a49cf4c5a954eebea0a23";
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
    ident = "cssstyle";
    ldir  = "info/unscoped/c/cssstyle";
    inherit packument fetchInfo;
  } // latest';

}
