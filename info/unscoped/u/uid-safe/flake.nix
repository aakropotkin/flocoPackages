{

  inputs.packument.url   = "https://registry.npmjs.org/uid-safe?rev=45-0f407f78300a4557192c7f40c980ec6d";
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
    ident = "uid-safe";
    ldir  = "info/unscoped/u/uid-safe";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
