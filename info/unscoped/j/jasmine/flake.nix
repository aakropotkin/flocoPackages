{

  inputs.packument.url   = "https://registry.npmjs.org/jasmine?rev=150-509f2f905ea4bb60dcaa1c03283bd015";
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
    ident = "jasmine";
    ldir  = "info/unscoped/j/jasmine";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
