{

  inputs.packument.url   = "https://registry.npmjs.org/browser-pack?rev=139-952386827396b8948db449aca62fb582";
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
    ident = "browser-pack";
    ldir  = "info/unscoped/b/browser-pack";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
