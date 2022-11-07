{

  inputs.packument.url   = "https://registry.npmjs.org/cli-columns?rev=22-961b052f4f6f2d536664cc28c81b5ab3";
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
    ident = "cli-columns";
    ldir  = "info/unscoped/c/cli-columns";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
