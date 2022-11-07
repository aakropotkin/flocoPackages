{

  inputs.packument.url   = "https://registry.npmjs.org/css-prefers-color-scheme?rev=14-2df5a587ff06210ae0a4e2b532039792";
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
    ident = "css-prefers-color-scheme";
    ldir  = "info/unscoped/c/css-prefers-color-scheme";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
