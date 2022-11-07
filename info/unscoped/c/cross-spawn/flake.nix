{

  inputs.packument.url   = "https://registry.npmjs.org/cross-spawn?rev=145-433af37229f25378441b30ef147cf168";
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
    ident = "cross-spawn";
    ldir  = "info/unscoped/c/cross-spawn";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
