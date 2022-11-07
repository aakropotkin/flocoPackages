{

  inputs.packument.url   = "https://registry.npmjs.org/expand-tilde?rev=23-7b0feab3345bda9d32df3b6f2ce44ab5";
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
    ident = "expand-tilde";
    ldir  = "info/unscoped/e/expand-tilde";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
