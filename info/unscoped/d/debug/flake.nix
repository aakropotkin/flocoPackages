{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/debug?_rev=940-6336a0fb43a738a59fe1da73feaf9a7a";
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
    ident = "debug";
    ldir  = "info/unscoped/d/debug";
    inherit packument fetchInfo;
  } // latest';

}
