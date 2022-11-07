{

  inputs.packument.url   = "https://registry.npmjs.org/user?rev=12-bfda271f3bfd7abdd1a1af5fa247f66f";
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
    ident = "user";
    ldir  = "info/unscoped/u/user";
    inherit packument fetchInfo;
  } // latest';

}
