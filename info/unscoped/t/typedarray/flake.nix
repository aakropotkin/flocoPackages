{

  inputs.packument.url   = "https://registry.npmjs.org/typedarray?rev=23-aeb9f30312bbe76de77d7e5a58d8129f";
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
    ident = "typedarray";
    ldir  = "info/unscoped/t/typedarray";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
