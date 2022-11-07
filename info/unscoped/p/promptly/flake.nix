{

  inputs.packument.url   = "https://registry.npmjs.org/promptly?rev=54-dffd19d820c71cd1e3000092dbfa512f";
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
    ident = "promptly";
    ldir  = "info/unscoped/p/promptly";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
