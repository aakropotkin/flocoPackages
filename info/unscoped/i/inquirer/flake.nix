{

  inputs.packument.url   = "https://registry.npmjs.org/inquirer?rev=664-6ecb0f29fb2730e5fc530a879ed8f19e";
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
    ident = "inquirer";
    ldir  = "info/unscoped/i/inquirer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
