{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/tailwindcss?_rev=979-107202f0cf6b7548609f8e83b65f3b0a";
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
    ident = "tailwindcss";
    ldir  = "info/unscoped/t/tailwindcss";
    inherit packument fetchInfo;
  } // latest';

}
