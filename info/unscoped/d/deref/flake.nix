{

  inputs.packument.url   = "https://registry.npmjs.org/deref?rev=48-9bb75f66e1a29e6b067825ad2b5ffcd2";
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
    ident = "deref";
    ldir  = "info/unscoped/d/deref";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
