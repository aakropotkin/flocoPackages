{

  inputs.packument.url   = "https://registry.npmjs.org/rc-virtual-list?rev=90-8d77fd0eec5a2860925dc0c22e1c258d";
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
    ident = "rc-virtual-list";
    ldir  = "info/unscoped/r/rc-virtual-list";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
