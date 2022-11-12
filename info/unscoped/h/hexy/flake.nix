{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/hexy?_rev=49-37608bfa052559df971238eec811dcbf";
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
    ident = "hexy";
    ldir  = "info/unscoped/h/hexy";
    inherit packument fetchInfo;
  } // latest';

}
