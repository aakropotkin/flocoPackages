{

  inputs.packument.url   = "https://registry.npmjs.org/@firebase/auth-compat?rev=554-f4bbf3355d30d2157d29283c333669bd";
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
    scope = "@firebase";
    ident = "@firebase/auth-compat";
    ldir  = "info/firebase/auth-compat";
    inherit packument fetchInfo;
  } // latest';

}
