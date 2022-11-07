{

  inputs.packument.url   = "https://registry.npmjs.org/fill-range?rev=58-6c1fe19fc11023d4f7729afc09ce7d70";
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
    ident = "fill-range";
    ldir  = "info/unscoped/f/fill-range";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
