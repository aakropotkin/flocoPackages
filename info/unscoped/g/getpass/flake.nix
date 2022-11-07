{

  inputs.packument.url   = "https://registry.npmjs.org/getpass?rev=40-2d7ac6cb491b310ae966d00dd5599611";
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
    ident = "getpass";
    ldir  = "info/unscoped/g/getpass";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
